from flask import (
    Blueprint, flash, g, redirect, render_template, request, url_for, jsonify
)
from werkzeug.exceptions import abort
import pandas as pd

from jobstatus.auth import login_required
from jobstatus.db import get_db


bp = Blueprint('job', __name__, url_prefix="/batch/api/v1.0/job")


def get_status(job_name, check_author=True):
    status_sql = """
    select joid, job_name, run_machine, status, status_text, 
    exit_code, status_time, replace(status_timestr, '/', '-') status_timestr,
    last_start, last_end from est_jobst where job_name = ?
    """
    
    db = get_db()
    cur_job = job_name.upper()

    updated_sql = status_sql.replace("?", "'" + cur_job + "'")
    # jobs = db.execute(
    #     status_sql, (cur_job,)
    # ).fetchall()

    status_df = pd.read_sql(updated_sql, db)

    col_list = status_df.columns
    
    # got through all column names and create a 
    # camelCase version of those column names
    json_col_list = []
    for cur_col in col_list:
        # if we have _, we have tokens to split and capitalize
        if "_" in cur_col:
            cur_tokens = cur_col.split("_")
            final_col = cur_tokens[0].lower()
            for cur_token in cur_tokens[1:]:
                final_col += cur_token.capitalize()
        else:
            final_col = cur_col.lower()

        json_col_list.append(final_col)    

    # apply new column names to data fram
    status_df.columns = json_col_list

    # convert results to list of dicts ( so it can be easily made to json )
    results = status_df.to_dict(orient='records')

    return results

@bp.route('/<string:job_name>/status', methods=('GET', ))
def status_list(job_name):
    job_list = get_status(job_name)

    return jsonify(job_list)

    
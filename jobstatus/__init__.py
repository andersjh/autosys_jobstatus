import os

from flask import Flask
from . import db



def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY='dev',
        DATABASE=os.path.join(app.instance_path, 'estrprd.sqlite'),
        STATUS_SQL="""
        select joid, job_name, run_machine, status, status_text, exit_code, status_time, status_timestr,
        last_start, last_end from est_jobst where job_name = '{}'         
        """,
    )

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # wire up other features
    db.init_app(app)

    from . import auth
    from . import blog
    from . import job

    app.register_blueprint(auth.bp)
    app.register_blueprint(blog.bp)
    app.register_blueprint(job.bp)
    app.add_url_rule('/', endpoint='index')

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass



    # a simple page that says hello
    @app.route('/hello')
    def hello():
        return 'Hello, World!'

    return app
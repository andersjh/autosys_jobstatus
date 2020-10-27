c:
cd /
cd Users\ander\python\try

set FLASK_ENV=development
copy venv\Lib\site-packages\jobstatus\estrprd.sqlite venv\var\jobstatus-instance\estrprd.sqlite /Y
c:\users\ander\python\try\venv\Scripts\waitress-serve --call jobstatus:create_app
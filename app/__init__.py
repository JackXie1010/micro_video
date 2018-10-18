#coding:utf8
import os

from flask import Flask,render_template
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import pymysql

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "mysql+pymysql://root:root@127.0.0.1:3306/movie"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = True
app.config["SECRET_KEY"] = "81dad0d7b7d24cd49f871d2cab10d0e9"
app.config["UP_DIR"] = os.path.join(os.path.abspath(os.path.dirname(__file__)), "static/upload/")
app.config["FC_DIR"] = os.path.join(os.path.abspath(os.path.dirname(__file__)), "static/upload/users/")
app.debug = True
db = SQLAlchemy(app)

from app.admin import admin as admin_blueprint
from app.home import home as home_blueprint

#注册蓝图
app.register_blueprint(admin_blueprint,url_prefix = "/admin")
app.register_blueprint(home_blueprint)

@app.errorhandler(404)
def page_not_found(error):
    return render_template("home/404.html"), 404
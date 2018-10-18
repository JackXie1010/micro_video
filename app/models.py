# coding:utf8
from datetime import datetime
from app import db

#1.会员
class User(db.Model):
    __tablename__ = 'user'
    id = db.Column(db.Integer,primary_key=True)#编号
    name = db.Column(db.String(100),unique=True)#昵称
    pwd = db.Column(db.String(100))#密码
    email = db.Column(db.String(100),unique=True)#邮箱
    phone = db.Column(db.String(11),unique=True)#电话
    info = db.Column(db.Text)#个性简介
    face = db.Column(db.String(255),unique=True)#头像
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)#注册时间
    uuid = db.Column(db.String(255),unique=True)#唯一标志符
    userlogs = db.relationship('Userlog',backref='user')#会员日志的关联关系
    comments = db.relationship('Comment',backref='user')#评论外键的关联关系
    moviecols = db.relationship('Moviecol',backref='user')#电影收藏外键的关联关系
    def __repr__(self):
        return "<User %r>" % self.name
    def check_pwd(self, pwd):
        from werkzeug.security import check_password_hash
        return check_password_hash(self.pwd, pwd)

#2.会员登录日志
class Userlog(db.Model):
    __tablename__ = 'userlog'
    id = db.Column(db.Integer,primary_key=True)
    user_id = db.Column(db.Integer,db.ForeignKey('user.id'))#所属会员id
    ip = db.Column(db.String(100))#登录ip
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)#登录日志时间
    def __repr__(self):
        return "<Userlog %r>" % self.id

#3.标签
class Tag(db.Model):
    __tablename__ = 'tag'
    id = db.Column(db.Integer,primary_key=True)
    name = db.Column(db.String(100),unique=True)#标题
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)#添加时间
    movies = db.relationship('Movie',backref='tag')#电影外键的关系关联
    def __repr__(self):
        return "<Tag %r>" % self.name

#4.电影
class Movie(db.Model):
    __tablename__ = 'movie'
    id = db.Column(db.Integer,primary_key=True)
    title = db.Column(db.String(255),unique=True)#电影标题
    url = db.Column(db.String(255),unique=True)#地址
    info = db.Column(db.Text) #简介
    logo = db.Column(db.String(255),unique=True)#封面
    start = db.Column(db.SmallInteger)#星级
    playnum = db.Column(db.BigInteger)#播放量
    commentnum = db.Column(db.BigInteger)#评论量
    tag_id = db.Column(db.Integer,db.ForeignKey('tag.id'))#所属标签
    area = db.Column(db.String(255))#上映地区
    release_time = db.Column(db.Date)#上映时间
    length = db.Column(db.String(100))#播放长度
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)#添加时间
    comments = db.relationship('Comment',backref='movie')#评论外键关联关系
    moviecols = db.relationship('Moviecol',backref='movie')#收藏外键关联关系
    def __repr__(self):
        return "<Movie %r>" % self.title

#5.上映预告
class Preview(db.Model):
    __tablename__ = 'preview'
    id = db.Column(db.Integer,primary_key=True)
    title = db.Column(db.String(255),unique=True)#电影标题
    logo = db.Column(db.String(255),unique=True)#封面
    addtime = db.Column(db.DateTime,index=True,default=datetime.now)#添加时间
    def __repr__(self):
        return "<Preview %r>" % self.title

#6.评论
class Comment(db.Model):
    __tablename__ = 'comment'
    id = db.Column(db.Integer,primary_key=True)
    content = db.Column(db.Text) #评论内容
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))#所属会员
    movie_id = db.Column(db.Integer, db.ForeignKey('movie.id'))#所属电影
    addtime = db.Column(db.DateTime, index=True, default=datetime.now)#评论添加的时间
    def __repr__(self):
        return "<Comment %r>" %self.id

#7.收藏
class  Moviecol(db.Model):
    __tablename__ = 'moviecol'
    id = db.Column(db.Integer,primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))#所属会员id
    movie_id = db.Column(db.Integer, db.ForeignKey('movie.id'))#所属电影id
    addtime = db.Column(db.DateTime, index=True, default=datetime.now)#收藏添加时间
    def __repr__(self):
        return "<Moviecol %r>" %self.id

#8.权限
class Auth(db.Model):
    __tablename__ = 'auth'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), unique=True)#名称
    url = db.Column(db.String(255), unique=True)#地址
    addtime = db.Column(db.DateTime, index=True, default=datetime.now)#添加时间
    def __repr__(self):
        return "<Auth %r>" % self.name

#9.角色
class Role(db.Model):
    __tablename__ = 'role'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), unique=True)#名称
    auths = db.Column(db.String(600))#角色权限列表
    addtime = db.Column(db.DateTime, index=True, default=datetime.now)#添加时间
    admins = db.relationship('Admin', backref = 'role') #管理员的外键关联关系
    def __repr__(self):
        return "<Role %r>" % self.name

#10.管理员
class Admin(db.Model):
    __tablename__ = 'admin'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), unique=True)#管理员账户
    pwd = db.Column(db.String(100))#管理员密码
    is_super = db.Column(db.SmallInteger)#是否是超级管理员，0为超级管理员
    role_id = db.Column(db.Integer, db.ForeignKey('role.id'))#所属角色id
    addtime = db.Column(db.DateTime, index=True, default=datetime.now)#添加时间
    adminlogs = db.relationship('Adminlog', backref='admin')#管理员登录日志外键关系关联
    Oplogs = db.relationship('Oplog', backref='admin')#操作日志外键关系关联
    def __repr__(self):
        return "<Admin %r>" % self.name
    def check_pwd(self, pwd):
        from werkzeug.security import check_password_hash
        return check_password_hash(self.pwd, pwd)#第一个pwd是数据库中的正确的密码，后面的pwd是从表单传递过来待验证的密码

#11.管理员登录日志
class Adminlog(db.Model):
    __tablename__ = 'adminlog'
    id = db.Column(db.Integer, primary_key=True)
    admin_id = db.Column(db.Integer, db.ForeignKey('admin.id'))#所属管理员
    ip = db.Column(db.String(100))#登录ip
    addtime = db.Column(db.DateTime, index=True, default=datetime.now)#添加时间
    def __repr__(self):
        return "<Adminlog %r>" % self.id

#12.操作日志
class Oplog(db.Model):
    __tablename__ = 'Oplog'
    id = db.Column(db.Integer, primary_key=True)
    admin_id = db.Column(db.Integer, db.ForeignKey('admin.id'))#所属管理员
    ip = db.Column(db.String(100))#登录ip
    reson = db.Column(db.String(600))#操作原因
    addtime = db.Column(db.DateTime, index=True, default=datetime.now)#添加时间
    def __repr__(self):
        return "<Oplog %r>" % self.id
'''
if __name__ == "__main__":
    db.create_all()

     role = Role(
        name = "超级管理员",
        auths = ""
    )
    db.session.add(role)
    db.session.commit()

    from werkzeug.security import generate_password_hash
    admin = Admin(
        name = 'jimmovie',
        pwd = generate_password_hash('jimmovie'),
        is_super = 0,
        role_id = 1
    )
    db.session.add(admin)
    db.session.commit()
'''
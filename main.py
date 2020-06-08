from flask import Flask, render_template, url_for, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
import json
from datetime import datetime
import random
from flask_mail import Mail

#I added this comment

with open('config.json', 'r') as c:
    params = json.load(c)["params"]

app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

if (params["local_server"]):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)

class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String(50), unique = False, nullable = False)
    email = db.Column(db.String(20), nullable = False)
    phone_num = db.Column(db.String(10), nullable = False)
    mes = db.Column(db.String(200), nullable = False)
    date = db.Column(db.String(12))

class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key = True)
    title = db.Column(db.String(80), unique = False, nullable = False)
    slug = db.Column(db.String(21), nullable = False)
    content = db.Column(db.String(300), nullable = False)
    date = db.Column(db.String(12))
    img_file = db.Column(db.String(12), nullable = True)


@app.route('/')
def home():
    #Fileter_by query is not needed.
    posts = Posts.query.filter_by().all()[0:params['num_of_pos']]
    return render_template('index.html', params=params, posts=posts)

@app.route('/about')
def about():
    return render_template('about.html', params=params)


@app.route('/dashboard', methods = ['GET', 'POST'])
def dashboard():
    #Check if user had already logged in
    if 'user' in session and session['user'] == params['admin_user']:
        posts = Posts.query.all()
        return render_template('dashboard.html', params=params, posts=posts)

    if request.method == 'POST':
        #Redirect to admin panel after authentication
        username = request.form.get('uname')
        password = request.form.get('password')

        if username == params['admin_user'] and password == params['admin_password']:
            #set the session variable
            session['user'] = username
            posts = Posts.query.all()
            return render_template('dashboard.html', params=params, posts=posts)

    return render_template('login.html', params=params)
        


@app.route('/contact', methods = ['GET', 'POST'])
def contact():
    if(request.method == 'POST'):
        #Add entry to the database
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')

        entry = Contacts(name=name, email=email, phone_num=phone, mes=message, date=datetime.now())
        db.session.add(entry)
        db.session.commit()

    return render_template('contact.html', params=params)

@app.route('/post/<string:post_slug>', methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()

    return render_template('post.html', params=params, post=post)

@app.route('/edit/<string:post_sno>', methods=['GET', 'POST'])
def edit_route(post_sno):
    post = Posts.query.filter_by(sno=post_sno).first()
    if 'user' in session and session['user'] == params['admin_user']:
        if request.method == 'POST':
            sno = post_sno
            box_title = request.form.get('title')
            box_content = request.form.get('content')
            box_slug = box_title[0:150].replace(" ","-") + "-" + str(random.randint(1000,100000))
            box_img = request.form.get('image')
            date=datetime.now()

            if sno == 'create-new-post':
                post = Posts(title = box_title, content = box_content, slug = box_slug, date=date, img_file = box_img)
                db.session.add(post)
                db.session.commit()
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = box_title
                post.content = box_content
                post.img_file = box_img
                post.slug = box_title[0:150].replace(" ","-") + "-" + str(random.randint(1000,100000))
                db.session.commit()
                return redirect("/edit/"+sno)
       
        return render_template('edit.html', params=params, post=post, sno=post_sno)
       

if __name__ == "__main__":
    app.run(debug=True)

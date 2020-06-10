from flask import Flask, render_template, url_for, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
import json
from datetime import datetime
import random
import os
import math


with open('config.json', 'r') as c:
    params = json.load(c)["params"]

app = Flask(__name__)
app.secret_key = os.urandom(24)
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

SESSION_COOKIE_SECURE=True
SESSION_COOKIE_NAME='codingthon-website'

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
    #Pagination logic
    posts = Posts.query.filter_by().all()
    last = math.floor(len(posts)/int(params['num_of_pos']))+1
    # posts = Posts[]
    page = request.args.get('page')
    
    if (not str(page).isnumeric()):
        page = 1
    page = int(page)
    posts = posts[(page-1)*int(params['num_of_pos']): (page-1)*int(params['num_of_pos']) + int(params['num_of_pos'])]
    #On first page
    if page == 1:
        prevpage = '#'
        nextpage = '/?page=' + str(page+1)

    #On last page
    elif page ==last:
        prevpage = '/?page=' + str(page-1)
        nextpage = '#'
    
    #On middle page
    else:
        prevpage = '/?page=' + str(page-1)
        nextpage = '/?page=' + str(page+1)
    
    #Fileter_by query is not needed.
   # posts = Posts.query.filter_by().all()[0:params['num_of_pos']]
    return render_template('index.html', params=params, posts=posts, prevpage=prevpage, nextpage=nextpage)

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
       

@app.route('/delete/<string:post_sno>', methods=['GET', 'POST'])
def delete_route(post_sno):
    if 'user' in session and session['user'] == params['admin_user']:
        post = Posts.query.filter_by(sno=post_sno).first()
        db.session.delete(post)
        db.session.commit()
        return redirect('/dashboard')


@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/dashboard')


if __name__ == "__main__":
    app.run(debug=True)

from flask import Flask, render_template, url_for, request
from flask_sqlalchemy import SQLAlchemy
import json
from datetime import datetime
from flask_mail import Mail


with open('config.json', 'r') as c:
    params = json.load(c)["params"]

app = Flask(__name__)

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
    img_file = db.Column(db.String(12), nullable = False)



@app.route('/')
def home():
    #Fileter_by query is not needed.
    posts = Posts.query.filter_by().all()[0:params['num_of_pos']]
    return render_template('index.html', params=params, posts=posts)

@app.route('/about')
def about():
    return render_template('about.html', params=params)

@app.route('/dashboard')
def dashboard():
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

if __name__ == "__main__":
    app.run(debug=True)

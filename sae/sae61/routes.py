from flask import render_template, redirect, url_for, flash
from app import app, db
from app.forms import RegistrationForm
from app.models import User

@app.route('/')
@app.route('/index')
def index():
    return "Welcome to the registration page!"

@app.route('/newuser', methods=['GET', 'POST'])
def new_user():
    form = RegistrationForm()
    if form.validate_on_submit():
        user = User(username=form.username.data, email=form.email.data, password_hash=form.password.data)
        db.session.add(user)
        db.session.commit()
        flash('Account created successfully!', 'success')
        return redirect(url_for('index'))
    return render_template('new_user.html', title='New User', form=form)


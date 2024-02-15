from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField
from wtforms.validators import DataRequired, Length, Regexp

class RegistrationForm(FlaskForm):
    username = StringField('Username', validators=[DataRequired(), Length(min=6, max=10), Regexp('^[a-z0-9]+$')])
    password = PasswordField('Password', validators=[DataRequired(), Length(min=6, max=15), Regexp('^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[%#{}@]).{6,15}$')])
    email = StringField('Email', validators=[DataRequired(), Regexp('^[\w\.-]+@[\w\.-]+(\.[\w]+)+$')])
    submit = SubmitField('Sign Up')


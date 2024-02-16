import re
from flask import Flask, render_template, request

app = Flask(__name__, template_folder='templates')


# Configuration de la connexion à la base de données
# db_config = {
#  'user': 'username',
#   'password': 'root',
#   'host': 'localhost',
#    'database': 'demosql',
# }
# conn = mysql.connector.connect(**db_config)
# cursor = conn.cursor()

def validate_email(email):
    # Regex pour valider l'email
    email_regex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    return bool(re.match(email_regex, email))

def validate_password(password):
    # Regex pour valider le mot de passe
    password_regex = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$'
    return bool(re.match(password_regex, password))

def validate_username(username):
    # Regex pour valider l'identifiant
    username_regex = r'^[a-zA-Z0-9]{6,}$'
    return bool(re.match(username_regex, username))

@app.route('/')
def index():
    # Affiche le formulaire
    return render_template('index.html')

@app.route('/newuser/', methods=['GET', 'POST'])
def new_user():
    if request.method == 'POST':
        # Récupère les valeurs soumises dans le formulaire
        username = request.form.get('username')
        email = request.form.get('email')
        password = request.form.get('password')

        # Valide l'email, l'identifiant et le mot de passe avec les regex
        is_valid_email = validate_email(email)
        is_valid_username = validate_username(username)
        is_valid_password = validate_password(password)

        # Affiche un message approprié
        message = ""
        if is_valid_email and is_valid_username and is_valid_password:
            message = "L'identifiant, l'email et le mot de passe respectent les critères."
        else:
            message = "L'identifiant, l'email ou le mot de passe ne respectent pas les critères."

        # Affiche le message
        return message

    else:
        # Affiche la page avec le formulaire
        return render_template('new_user.html')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')


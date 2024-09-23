from flask import Flask, render_template

app = Flask(__name__)

 # Rota para a página inicial
@app.route('/')
def home():
    page = {
        'title': 'Página Inicial',
        'css': '/static/css/home.css',
        'js': '/static/js/home.js'
    }
    users = ('Maria', 'Joca', 'José', 'André')
    return render_template ('home.html', page=page, listaUsers = users)

@app.route('/contacts')
def contacts():

        page = {
        'title': 'Página Inicial',
        'css': 'home.css'
    }

    return render_template('contacts.html', page = page)


if __name__ == '__main__':
    app.run(debug=True)
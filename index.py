from flask import Flask, render_template
from flask_mysqldb import MySQL  

SITE = {
    "name": "dazblog",
    "owner": "Daz",
    "logo": "",
    "favicon": ""
}

app = Flask(__name__)

app.config["MYSQL_HOST"] = ""
app.config["MYSQL_USER"] = "root"
app.config["MYSQL_PASSWORD"] = ""
app.config["MYSQL_DB"] = "dazblogdb"

@app.route('/')  # Rota para a página inicial
def home():
    toPage = {
         "site": SITE,
         "title": "",
         "css":"home.css",
         "js": "home.js"
    }

app.route('/view/artid') # Rota para a página que exibe o artigo completo
def view(artid):

    sql = '''

    '''
    toPage = {
         'site': SITE,
         'title': '',
         'css': 'view.css'
    }
    return render_template("view.html", page = toPage)

@app.route('/contacts') # Rota para a página de contatos
def contacts():
        toPage = {
             "site": SITE,
             "title": "Faça Contato",
             "css": "home.css"
        }

        return render_template('contacts.html', page = toPage)

@app.route('/about') # Rota para a página Sobre
def about():
     toPage = {
          "site": SITE,
          "title": "Sobre Nós",
          "css": "about.css"
     }

     return render_template('about.html', page = toPage)


if __name__ == '__main__':
    app.run(debug=True)
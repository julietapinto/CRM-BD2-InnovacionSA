from flask import Flask, render_template, request, redirect
import pyodbc

app = Flask(__name__)

conn = pyodbc.connect(
    'DRIVER={ODBC Driver 17 for SQL Server};'
    'SERVER=DESKTOP-A44JULR\SQLEXPRESS;'
    'DATABASE=CRM_InnovacionSA;'
    'Trusted_Connection=yes;'
)

@app.route("/")
def index():
    return render_template("index.html")


@app.route("/clientes")
def clientes():

    cursor = conn.cursor()

    cursor.execute("""
        SELECT
            id_cliente,
            nombre_comercial,
            telefono,
            correo
        FROM CLIENTES
    """)

    datos = cursor.fetchall()

    return render_template(
        "clientes.html",
        clientes=datos
    )


@app.route("/nuevo_cliente", methods=["POST"])
def nuevo_cliente():

    nombre = request.form["nombre"]
    direccion = request.form["direccion"]
    telefono = request.form["telefono"]
    celular = request.form["celular"]
    correo = request.form["correo"]

    cursor = conn.cursor()

    cursor.execute("""
        EXEC sp_InsertarCliente
        ?,?,?,?,?,
        'P',
        3
    """,
    nombre,
    direccion,
    telefono,
    celular,
    correo)

    conn.commit()

    return redirect("/clientes")


@app.route("/oportunidades")
def oportunidades():

    cursor = conn.cursor()

    cursor.execute("""
        EXEC sp_ReporteOportunidades
    """)

    datos = cursor.fetchall()

    return render_template(
        "oportunidades.html",
        oportunidades=datos
    )


if __name__ == "__main__":
    app.run(debug=True)

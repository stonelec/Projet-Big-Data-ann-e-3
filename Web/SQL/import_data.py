import asyncio
import asyncpg              # pip install asyncpg
from pandas import read_csv

async def main():
    csv_data = read_csv('Data_Arbre.csv', encoding='utf-8')
    try:
        conn = await asyncpg.connect(
            database="datarbuste",
            user="ethan",
            password="ethan",
            host="127.0.0.1",
            port=5432
        )

        id_user = 1

        for i, ligne in csv_data.iterrows():
            await conn.execute("""
                INSERT INTO public.arbre (id_user,longitude, latitude, hauteur_tot, hauteur_tronc, diametre_tronc, id_etat_arbre,
                                    id_stade_dev, id_port, id_pied, espece, remarquable, id_feuillage, age_estim, revetement)
                VALUES ($1, $2, $3, $4, $5, $6,
                        (SELECT id_etat_arbre FROM etat_arbre WHERE etat_arb = $7),
                        (SELECT id_stade_dev FROM stade_de_dev WHERE stade_dev = $8),
                        (SELECT id_port FROM type_de_port WHERE type_port = $9),
                        (SELECT id_pied FROM type_de_pied WHERE type_pied = $10),
                        $11, $12, (SELECT id_feuillage FROM type_feuillage WHERE feuillage = $13),
                        $14, $15)
                """,
                int(id_user), float(ligne['longitude']), float(ligne['latitude']), int(ligne['haut_tot']), int(ligne['haut_tronc']),
                int(ligne['tronc_diam']), ligne['fk_arb_etat'].lower(), ligne['fk_stadedev'].lower(), ligne['fk_port'].lower(),
                ligne['fk_pied'].lower(), ligne['fk_nomtech'].lower(), 1 if ligne['remarquable'].lower() == "oui" else 0,
                ligne['feuillage'].lower(), int(ligne['age_estim']), 1 if ligne['fk_revetement'].lower() == "oui" else 0
            )

        await conn.close()

    except Exception as e:
        print(e)

# Run the asyncio event loop with the main coroutine
if __name__ == '__main__':
    asyncio.run(main())
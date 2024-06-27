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

        for i, ligne in csv_data.iterrows():
            await conn.execute("""
                INSERT INTO public.arbre (id_user,longitude, latitude, hauteur_tot, hauteur_tronc, diametre_tronc, id_etat_arbre,
                                    id_stade_dev, id_port, id_pied, espece, remarquable, id_feuillage, age_estim, revetement)
                VALUES ($1, $2, $3, $4, $5, $6,
                        (S)
                """,
                int(row['id_user']), float(row['longitude']), float(row['latitude']), int(row['haut_tot']), int(row['haut_tronc']),
            )

            await conn.execute("""
                INSERT INTO tree (haut_tronc, haut_tot, tronc_diam, prec_estim, clc_nbr_diag, age_estim, remarquable,
                                  longitude, latitude, id_etat_arbre, id_pied, id_port, id_stade_dev, nom)
                VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9,
                        (SELECT id FROM etat_arbre WHERE value = $10),
                        (SELECT id FROM pied WHERE value = $11),
                        (SELECT id FROM port WHERE value = $12),
                        (SELECT id FROM stade_dev WHERE value = $13), $14)
                """,
                int(row['haut_tronc']), int(row['haut_tot']), int(row['tronc_diam']), int(row['fk_prec_estim']), int(row['clc_nbr_diag']),
                int(row['age_estim']), True if row['remarquable'].lower() == "oui" else False, float(row['longitude']), float(row['latitude']),
                row['fk_arb_etat'].lower(), row['fk_pied'].lower(), row['fk_port'].lower(), row['fk_stadedev'].lower(),
                row['fk_nomtech'].lower()
            )

        await conn.close()

    except Exception as e:
        print(e)

# Run the asyncio event loop with the main coroutine
if __name__ == '__main__':
    asyncio.run(main())
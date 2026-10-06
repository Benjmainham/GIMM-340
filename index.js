const express = require('express');
const multer = require('multer');
const mysql = require('mysql2/promise');

const app = express();
app.use(express.static('public'));

const upload = multer();
const port = 80;

let connection = null;

async function query(sql, params) {
    if (!connection) {
        connection = await mysql.createConnection({
            host: "student-databases.cvode4s4cwrc.us-west-2.rds.amazonaws.com",
            user: "KYLABENTLEY",
            password: "uGbHe06d10uq14Tr1dzRvIzi8TH4iZjCqyn",
            database: "KYLABENTLEY"
        });
    }

    const [results] = await connection.execute(sql, params);
    return results;
}

/* =========================
   FILTER POKEMON
========================= */
app.get('/collection/', async (req, res) => {
    try {
        let sql = `
            SELECT pc.id, pc.pokemon_name, pc.number, pc.rarity,
                   c.collection_name AS collection
            FROM pokemon_cards pc
            INNER JOIN collections c ON pc.collection_id = c.id
        `;

        let where = [];
        let params = [];

        if (req.query.pokemon_name) {
            where.push('pc.pokemon_name LIKE ?');
            params.push(`%${req.query.pokemon_name}%`);
        }

        if (req.query.number) {
            where.push('pc.number LIKE ?');
            params.push(`%${req.query.number}%`);
        }

        if (req.query.rarity) {
            where.push('pc.rarity LIKE ?');
            params.push(`%${req.query.rarity}%`);
        }

        if (where.length) {
            sql += ' WHERE ' + where.join(' AND ');
        }

        const order = req.query.order === 'desc' ? 'DESC' : 'ASC';
        const limit = parseInt(req.query.limit);

        sql += ` ORDER BY pc.pokemon_name ${order}`;

        if (!isNaN(limit) && limit > 0) {
            sql += ` LIMIT ${Math.min(limit, 500)}`;
        }

        const result = await query(sql, params);
        res.json({ data: result });

    } catch (err) {
        console.log(err);
        res.status(500).json({ message: err.message });
    }
});

/* =========================
   FILTER MTG
========================= */
app.get('/magic/', async (req, res) => {
    try {
        let sql = `
            SELECT mg.id, mg.mtg_name, mg.supertype, mg.mtg_rarity,
                   mg.card_number, mg.is_foil,
                   c.collection_name AS collection
            FROM magic_the_gathering mg
            INNER JOIN collections c ON mg.collection_id = c.id
        `;

        let where = [];
        let params = [];

        if (req.query.mtg_name) {
            where.push('mg.mtg_name LIKE ?');
            params.push(`%${req.query.mtg_name}%`);
        }

        if (req.query.supertype) {
            where.push('mg.supertype LIKE ?');
            params.push(`%${req.query.supertype}%`);
        }

        if (req.query.mtg_rarity) {
            where.push('mg.mtg_rarity = ?');
            params.push(req.query.mtg_rarity);
        }

        if (req.query.card_number) {
            where.push('mg.card_number = ?');
            params.push(req.query.card_number);
        }

        if (req.query.is_foil !== undefined && req.query.is_foil !== '') {
            where.push('mg.is_foil = ?');
            params.push(Number(req.query.is_foil));
        }

        if (where.length) {
            sql += ' WHERE ' + where.join(' AND ');
        }

        const order = req.query.order === 'desc' ? 'DESC' : 'ASC';
        const limit = parseInt(req.query.limit);

        sql += ` ORDER BY mg.mtg_name ${order}`;

        if (!isNaN(limit) && limit > 0) {
            sql += ` LIMIT ${Math.min(limit, 500)}`;
        }

        const result = await query(sql, params);
        res.json({ data: result });

    } catch (err) {
        console.log(err);
        res.status(500).json({ message: err.message });
    }
});

/* =========================
   ADD POKEMON (STRICT VALIDATION)
========================= */
app.post('/pokemon/insert', upload.none(), async (req, res) => {
    try {
        const { pokemon_name, number, rarity, collection_id } = req.body;

        let errors = {};

        if (!pokemon_name || pokemon_name.trim() === "") {
            errors.pokemon_name = "Name is required";
        }

        if (!number || number.toString().trim() === "") {
            errors.number = "Number is required";
        } else if (!/^[0-9]+$/.test(number)) {
            errors.number = "Number must be numeric";
        }

        if (!rarity || rarity.trim() === "") {
            errors.rarity = "Rarity is required";
        }

        if (!collection_id || collection_id.toString().trim() === "") {
            errors.pokemon_collection = "Collection ID is required";
        } else if (!/^[0-9]+$/.test(collection_id)) {
            errors.pokemon_collection = "Collection ID must be numeric";
        }

        if (Object.keys(errors).length > 0) {
            return res.status(400).json({ errors });
        }

        await query(
            `INSERT INTO pokemon_cards (pokemon_name, number, rarity, collection_id)
             VALUES (?, ?, ?, ?)`,
            [pokemon_name, number, rarity, collection_id]
        );

        res.json({ message: "Pokemon inserted successfully" });

    } catch (err) {
        console.log(err);
        res.status(500).json({ message: "Failed to insert Pokemon" });
    }
});

/* =========================
   ADD MTG (STRICT VALIDATION)
========================= */
app.post('/magic/insert', upload.none(), async (req, res) => {
    try {
        const {
            mtg_name,
            supertype,
            mtg_rarity,
            card_number,
            is_foil,
            collection_id
        } = req.body;

        let errors = {};

        if (!mtg_name || mtg_name.trim() === "") {
            errors.mtg_name = "Name required";
        }

        if (!supertype || supertype.trim() === "") {
            errors.mtg_supertype = "Supertype required";
        }

        if (!mtg_rarity || mtg_rarity.trim() === "") {
            errors.mtg_rarity = "Rarity required";
        }

        if (!card_number || card_number.toString().trim() === "") {
            errors.mtg_number = "Card number required";
        } else if (!/^[0-9]+$/.test(card_number)) {
            errors.mtg_number = "Must be numeric";
        }

        if (is_foil === undefined || is_foil === "") {
            errors.is_foil = "Foil selection required";
        }

        if (!collection_id || collection_id.toString().trim() === "") {
            errors.mtg_collection = "Collection ID required";
        } else if (!/^[0-9]+$/.test(collection_id)) {
            errors.mtg_collection = "Collection ID must be numeric";
        }

        if (Object.keys(errors).length > 0) {
            return res.status(400).json({ errors });
        }

        await query(
            `INSERT INTO magic_the_gathering
            (mtg_name, supertype, mtg_rarity, card_number, is_foil, collection_id)
            VALUES (?, ?, ?, ?, ?, ?)`,
            [
                mtg_name,
                supertype,
                mtg_rarity,
                card_number,
                Number(is_foil),
                collection_id
            ]
        );

        res.json({ message: "MTG card inserted successfully" });

    } catch (err) {
        console.log(err);
        res.status(500).json({ message: "Failed to insert MTG card" });
    }
});

/* =========================
   UPDATE POKEMON
========================= */
app.put('/pokemon/update/:id', upload.none(), async (req, res) => {
    try {
        const { pokemon_name, rarity, number } = req.body;

        await query(
            `UPDATE pokemon_cards 
             SET pokemon_name=?, rarity=?, number=? 
             WHERE id=?`,
            [pokemon_name, rarity, number, req.params.id]
        );

        res.json({ message: "Pokemon updated successfully" });

    } catch (err) {
        console.log(err);
        res.status(500).json({ message: "Failed to update Pokemon" });
    }
});

/* =========================
   UPDATE MTG
========================= */
app.put('/magic/update/:id', upload.none(), async (req, res) => {
    try {
        const {
            mtg_name,
            supertype,
            mtg_rarity,
            card_number,
            is_foil
        } = req.body;

        await query(
            `UPDATE magic_the_gathering 
             SET mtg_name=?, supertype=?, mtg_rarity=?, card_number=?, is_foil=? 
             WHERE id=?`,
            [
                mtg_name,
                supertype,
                mtg_rarity,
                card_number,
                Number(is_foil),
                req.params.id
            ]
        );

        res.json({ message: "MTG updated successfully" });

    } catch (err) {
        console.log(err);
        res.status(500).json({ message: "Failed to update MTG" });
    }
});

app.listen(port, () => {
    console.log(`Running at http://localhost:${port}`);
});
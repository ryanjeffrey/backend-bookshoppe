const pool = require('../utils/pool');

class Book {
  id;
  title;
  released;

  constructor({ id, title, released, authors }) {
    this.id = id;
    this.title = title;
    this.released = released;
    if (authors) {
      this.authors = authors ?? [];
    }
  }

  static async getAll() {
    const { rows } = await pool.query('SELECT * from books');
    return rows.map((row) => new Book(row));
  }

  static async getById(id) {
    const { rows } = await pool.query(
      `
    SELECT books.*, 
            COALESCE(
              json_agg(json_build_object('id', authors.id, 'name', authors.name))
            ) as authors
      FROM books
      LEFT JOIN authors_books on books.id = authors_books.book_id
      LEFT JOIN authors on authors.id = authors_books.author_id
      WHERE books.id = $1
      GROUP BY books.id;
      `,
      [id]
    );
    return new Book(rows[0]);
  }
}


module.exports = { Book };

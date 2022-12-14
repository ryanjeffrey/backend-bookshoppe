const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');
const app = require('../lib/app');

describe('books routes', () => {
  beforeEach(() => {
    return setup(pool);
  });

  it('should return a list of books', async () => {
    const res = await request(app).get('/books');
    expect(res.body.length).toEqual(6);
  });

  it('/books/:id should return book detail', async () => {
    const res = await request(app).get('/books');
    const meditations = res.body.find((book) => book.id === '6');
    expect(meditations).toHaveProperty('id', '6');
    expect(meditations).toHaveProperty('title', 'Meditations');
  });

  afterAll(() => {
    pool.end();
  });
});

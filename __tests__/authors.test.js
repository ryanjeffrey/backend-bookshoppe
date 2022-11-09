const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');
const app = require('../lib/app');

describe('authors routes', () => {
  beforeEach(() => {
    return setup(pool);
  });

  it('should return a list of authors', async () => {
    const res = await request(app).get('/authors');
    expect(res.body.length).toEqual(5);
  });

  it('/authors/:id should return author detail', async () => {
    const res = await request(app).get('/authors');
    const michelle = res.body.find((author) => author.id === '3');
    expect(michelle).toHaveProperty('id', '3');
    expect(michelle).toHaveProperty('name', 'Michelle Obama');
  });

  afterAll(() => {
    pool.end();
  });
});

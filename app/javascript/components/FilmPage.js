import React from 'react'
import { Image, Container, Row, Col } from 'react-bootstrap'
import Gallery from './Gallery'

const FilmPage = ({ film, actors }) => {

  return (
    <Container>
      <hr />
      <Row>
        <Col><Image src={film.image_url} /></Col>
        <Col>
          <h1>{film.name}</h1>
          <hr />
          <h4>About film</h4>
          <Row>
            <Col>
              <p>Release date</p>
            </Col>
            <Col>
              <p>{film.release_date}</p>
            </Col>
          </Row>
          <Row>
            <Col>
              <p>Genre</p>
            </Col>
            <Col>
              <p>{film.genre}</p>
            </Col>
          </Row>
          <Row>
            <Col>
              <p>Director</p>
            </Col>
            <Col>
              <p>{film.director}</p>
            </Col>
          </Row>
          <Row>
            <Col>
              <p>Rating</p>
            </Col>
            <Col>
              <p>{film.rating}</p>
            </Col>
          </Row>
        </Col>
      </Row>
      <Row>
        <h3 className='myClass'>Description</h3>
        <h3>{film.description}</h3>
      </Row>
      <Row>
        <h3 className='myClass'>Trailer</h3>
        <iframe width='420' height='330'
          src={film.trailer}>
        </iframe>
      </Row>

      <Gallery actors={actors} />
    </Container>
  )
}

export default FilmPage

import React from "react"
import { Image, Container, Row, Col } from 'react-bootstrap'

const FilmPage = ({ film }) => {
  return (
    <Container>
      <Row>
        <Col><Image src={'/' + film.image_url} /></Col>
        <Col>
          <h1>{film.name}</h1>
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
        <h3>{film.description}</h3>
      </Row>
      <Row>
        <iframe width="420" height="315"
          src={film.trailer}>
        </iframe>
      </Row>
    </Container>
  )
}

export default FilmPage

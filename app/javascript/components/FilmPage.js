import React, { useState } from 'react'
import { Image, Container, Row, Col } from 'react-bootstrap'
import Gallery from './Gallery'
import { Rating } from 'react-simple-star-rating'


const FilmPage = ({ film, actors, token, rating: defaultRating, sign_in: login }) => {
  const [rating, setRating] = useState(defaultRating * 20)

  const handleRating = (rate) => {

    fetch(`${window.location.href}/rating.json`, {
      method: rating ? 'PUT' : 'POST',
      headers: {
        'X-CSRF-Token': token,
        'Content-type': 'application/json'
      },
      body: JSON.stringify({ rating: rate / 20 })
    })
  }

  console.log(login)
  return (
    <Container>
      <hr />
      <Row>
        <Col><Image height={340} src={film.image_url} /></Col>
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
              <p>Age rate</p>
            </Col>
            <Col>
              <p>{film.rating}</p>
            </Col>
          </Row>
          <hr />
          <Rating
            readonly={login ? false : true}
            allowHover={false}
            showTooltip
            onClick={handleRating}
            ratingValue={rating} />
          <hr />
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
      <hr />
      <Row> <h3 className='myClass'>Comments</h3></Row>

    </Container>
  )
}

export default FilmPage

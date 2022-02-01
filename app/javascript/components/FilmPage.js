import React, { useState } from 'react'
import { Image, Container, Row, Col, Button } from 'react-bootstrap'
import Gallery from './Gallery'
import { Rating } from 'react-simple-star-rating'
import CategoryButtons from './CategoryButtons';
import CommentList from './CommentList';

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
  return (
    <Container>
      <hr />
      <Row>
        <Col>
          <Image height={380} src={film.image_url} />
        </Col>

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
          {login
            ? <CategoryButtons
              filmId={film.id}
              watchlater={film.watchlater}
              viewed={film.viewed} />
            : null
          }
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
      <Row>
        <h3 className='myClass'>Comments</h3>
        <CommentList login={login}/>
      </Row>

    </Container>
  )
}

export default FilmPage

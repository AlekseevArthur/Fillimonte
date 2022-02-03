import React, { useState } from 'react'
import FilmCard from './FilmCard'
import SearchBar from './SearchBar'
import { Row, Button } from 'react-bootstrap'
import ModalWelcome from './ModalWelcome'

const MainPage = ({ films, login }) => {
  const [filteredFilms, setFilms] = useState([...films])
  const [modalShow, setModalShow] = useState(!login);

  const handleChange = (query) => {
    fetch(`/films?query=${query}`, {
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }
    })
      .then(res => res.json())
      .then(data => setFilms(data.films))
  }

  const sortByRating = () => setFilms(films.sort((a, b) => b.stars_rating - a.stars_rating))

  return (
    <div className='container'>
      <hr />
      <ModalWelcome
        show={modalShow}
        onHide={() => setModalShow(false)}
      />
      <SearchBar
        handleChange={handleChange}
      />
      <hr />
      <Button onClick={sortByRating} variant='success'>Sort by rating</Button>
      <hr />
      <Row xs={1} md={2} lg={3} className='g-4'>
        {
          filteredFilms.map((film, key) => <FilmCard film={film} key={key} />)
        }
      </Row>
      <hr />
    </div>
  )
}

export default MainPage

import React, { useState } from 'react'
import FilmCard from './FilmCard'
import SearchBar from './SearchBar'
import { Row } from 'react-bootstrap'

const MainPage = ({ films }) => {
  const [filteredFilms, setFilms] = useState([...films])

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

  return (
    <div className='container'>
      <hr />
      <SearchBar
        handleChange={handleChange}
      />
      <hr />
      <Row xs={1} md={2} lg={3} className='g-4'>
        {
          filteredFilms.map((film, key) => <FilmCard film={film} key={key} />)
        }
      </Row>
    </div>
  )
}

export default MainPage

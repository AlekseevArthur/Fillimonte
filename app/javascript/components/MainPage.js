import React from 'react'
import FilmCard from './FilmCard'
import SearchBar from './SearchBar'
import { Row } from 'react-bootstrap'

const MainPage = ({ films }) => {
  return (
    <div className='container'>
      <hr />
      <SearchBar />
      <hr />
      <Row xs={1} md={2} lg={3} className="g-4">
        {
          films.map((film, key) => <FilmCard film={film} key={key} />)
        }
      </Row>
    </div>
  )
}

export default MainPage

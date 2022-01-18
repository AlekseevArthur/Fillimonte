import React from 'react'
import FilmCard from './FilmCard'
import SearchBar from './SearchBar'
import { Row } from 'react-bootstrap'

const MainPage = ({ films }) => {
  return (
    <div className='container'>
      <SearchBar />
      <Row style={{ alignItems: 'center' }} >
        {
          films.map((film, key) => <FilmCard film={film} key={key} />)
        }
      </Row>
    </div>
  )
}

export default MainPage

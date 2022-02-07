import React, { useState } from 'react'
import { Button, Row, Col, Image, Nav } from 'react-bootstrap';
import { Bookmark, Eye, BookmarkXFill, EyeSlashFill } from 'react-bootstrap-icons';
import ModalDelete from './ModalDelete';


const CategoryCard = ({ film, category, updateFilms, setMessage }) => {
  const [modalShow, setModalShow] = useState(false);

  const deleteClick = () => {
    fetch(`/user/${category}?film_id=${film.id}`, {
      method: 'DELETE'
    })
      .then(() => {
        setMessage(`Deleted from ${category}`)
        updateFilms()
      })
  }

  const changeCategory = (e) => {
    e.preventDefault()
    fetch(`/user/${category == 'viewed' ? 'watchlater' : 'viewed'}?film_id=${film.id}`, {
      method: 'POST'
    })
      .then(() => {
        setMessage(`Added to ${category == 'viewed' ? 'watchlater' : 'viewed'}`)
        updateFilms()

      })
  }

  return (
    <Nav.Link style={{ padding: 0, color: 'black', margin: '5px 0' }} href={`/films/${film.id}`}>
      <Row style={{ border: '1px solid aqua', padding: '3px' }}>
        <Col sm={4} style={{ padding: 0 }}>
          <Image width={'90%'} src={film.image_url} />
        </Col>
        <ModalDelete
          show={modalShow}
          onClose={deleteClick}
          onHide={() => setModalShow(false)}
        />

        <Col sm={8}>
          <Row>
            {film.name}
          </Row>
          <Row>
            {film.genre}
          </Row>
          <Row>
            {film.director}
          </Row>
          <Row>
            {film.rating}
          </Row>
          <hr style={{ margin: '4px' }} />
          <Row>
            <Col>
              <Button
                name='changeCategory'
                onClick={changeCategory}>
                {category == 'watchlater' ? <Eye /> : <Bookmark />}
              </Button>
              <Button
                name='deleteBtn'
                variant="danger"
                onClick={(e) => {
                  e.preventDefault()
                  setModalShow(true)
                }}>
                {category == 'watchlater' ? <BookmarkXFill /> : <EyeSlashFill />}
              </Button>
            </Col>
          </Row>
        </Col>
      </Row>
    </Nav.Link>
  )
};

export default CategoryCard

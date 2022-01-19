import React, { useState } from 'react'
import { Row, Col, Button } from 'react-bootstrap'


const Gallery = ({ actors }) => {

  const [active, setActive] = useState(0)

  const next = () => {
    let newActive = active + 1 < actors.length ? active + 1 : 0
    setActive(newActive)
  }

  const prev = () => {
    let newActive = active - 1 >= 0 ? active - 1 : actors.length - 1
    setActive(newActive)
  }

  return (
    <>
      <Row>
        <h3 className='myClass'>Gallery</h3>
      </Row>
      <Row>
        <Col>
          <Button onClick={prev} variant='outline-primary' className='myButton'> &#10094;</Button>
        </Col>
        <Col sm={9}>
          <img className='gallery-main'
            src={actors.length > 0 ? actors[active].image_url : '/assets/actors/1.jpg'} />
          <p className='gallery-caption'>{actors.length > 0 ? actors[active].name : 'undefined'}</p>
        </Col>
        <Col>
          <Button onClick={next} variant='outline-primary' className='myButton'> &#10095; </Button>
        </Col>
      </Row>
      <Row>
        {actors.map((actor, key) =>
          <Col
            name={key}
            key={key}>
            <img
              className={key == active ? 'gallery-active' : 'gallery'}
              onClick={() => setActive(key)}
              src={actor.image_url} />
          </Col>
        )}
      </Row>
    </>
  )
}

export default Gallery

import React from 'react'
import { Carousel } from 'react-bootstrap'


const Gallery = ({ actors }) => {
  return (
    <Carousel variant="dark">
      <Carousel.Item>
        <img
          className="d-block h-100"
          src="/assets/District_nine_ver2.jpg"
          alt="First slide"
        />
        <Carousel.Caption>
          <h3>First slide label</h3>
          <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
        </Carousel.Caption>
      </Carousel.Item>

      <Carousel.Item>
        <img
          className="d-block h-100"
          src="/assets/District_nine_ver2.jpg"
          alt="Second slide"
        />
        <Carousel.Caption>
          <h3>Second slide label</h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
        </Carousel.Caption>
      </Carousel.Item>
    </Carousel>
  )
}

export default Gallery

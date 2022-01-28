import React, { useState } from 'react'
import { Button, Row, Col, Image, Nav } from 'react-bootstrap';
import { Rating } from 'react-simple-star-rating';
import { BookmarksFill, Eye, BookmarkXFill } from 'react-bootstrap-icons';

const CategoryCard = ({ image, data, rating, watchlater, viewed }) => {
  return (
    <Nav.Link style={{ padding: 0, color: 'black' }} href='#'>
      <Row style={{ border: '1px solid aqua', padding: '3px' }}>
        <Col sm={4} style={{ padding: 0 }}>
          <Image width={'90%'} src="/assets/images.jpg" />
        </Col>
        <Col sm={8}>
          <Row>
            MM WATCHASAY
          </Row>
          <Row>
            Genre
          </Row>
          <Row>
            Derecta
          </Row>
          <Row>
            Starring
          </Row>
          <hr style={{ margin: '4px' }} />
          <Row style={{ margin: 'auto' }}>
            <Rating
              readonly={true}
              allowHover={false}
              ratingValue={60} />
          </Row>
          <hr style={{ margin: '4px' }} />
          <Row>
            <Col>
              <Button>
                <Eye />
              </Button>
              <Button variant="danger">
                <BookmarkXFill />
              </Button>
            </Col>
          </Row>
        </Col>
      </Row>
    </Nav.Link>
  )
};

//<Card style={{ width: '18rem' }}>
//<Card.Img variant="top" src="/assets/actors/1.jpg" />
//<Card.Body>
//
//  <Card.Title>Card Title</Card.Title>
//  <Card.Text>
//   Some quick example text to build on the card title and make up the bulk of
//    the card's content.
//  </Card.Text>
//  <Button variant="primary">Go somewhere</Button>
//</Card.Body>
//</Card>

export default CategoryCard

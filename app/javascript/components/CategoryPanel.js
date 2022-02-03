import React, { useState } from 'react';
import { Container, Tabs, Tab, Spinner } from 'react-bootstrap';
import CategoryCard from './CategoryCard';
import { BookmarksFill, EyeFill } from 'react-bootstrap-icons';
import Toaster from './Toaster';

const CategoryPanel = () => {
  const [key, setKey] = useState('watchlater');
  const [loading, setLoad] = useState(true)
  const [films, setFilms] = useState({ viewed: [], watchlater: [] })
  const [message, setMessage] = useState({ message: '', show: false })

  const updateFilms = () => {
    if (loading)
      fetch('/user/watchlater')
        .then(res => res.json())
        .then(data => {
          setFilms(data)
          setLoad(false)
        })
  }

  updateFilms()
  return (
    <Container>
      <Toaster
        message={message}
        setShow={() => setMessage({ message: '', show: false })} />
      <Tabs
        id="controlled-tab-example"
        activeKey={key}
        onSelect={(k) => setKey(k)}
        className="mb-3"
      >
        <Tab
          name='watchlater'
          eventKey="watchlater"
          title={<BookmarksFill width={35} />}>
          <h3 className='myClass' style={{ paddingTop: 0 }}>Watchlater</h3>
          {loading
            ? <Spinner animation="border" variant="info" />
            : films.watchlater.map((film, key) => <CategoryCard
              updateFilms={() => setLoad(true)}
              category='watchlater'
              film={film}
              key={key}
              setMessage={(message) => setMessage({ message: message, show: true })}
            />)
          }
        </Tab>
        <Tab
          name='viewed'
          eventKey="viewed"
          title={<EyeFill width={35} />}>
          <h3
            className='myClass'
            style={{ paddingTop: 0 }}>
            Viewed</h3>
          {loading
            ? <Spinner
              animation="border"
              variant="info" />
            : films.viewed.map((film, key) => <CategoryCard
              updateFilms={() => setLoad(true)}
              category='viewed'
              film={film}
              key={key}
              setMessage={(message) => setMessage({ message: message, show: true })}
            />)
          }
        </Tab>
      </Tabs>
    </Container>
  )
};

export default CategoryPanel;

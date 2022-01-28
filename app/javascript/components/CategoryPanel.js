import React, { useState } from 'react';
import { Container, Tabs, Tab } from 'react-bootstrap';
import CategoryCard from './CategoryCard';
import { BookmarksFill, EyeFill } from 'react-bootstrap-icons';
const CategoryPanel = () => {
  const [key, setKey] = useState('watchlater');

  return (
    <Container>
      <Tabs
        id="controlled-tab-example"
        activeKey={key}
        onSelect={(k) => setKey(k)}
        className="mb-3"
      >
        <Tab eventKey="watchlater" title={<BookmarksFill width={35} />}>
          <h3 className='myClass' style={{ paddingTop: 0 }}>Watchlater</h3>
          <CategoryCard />
        </Tab>
        <Tab eventKey="viewed" title={<EyeFill width={35} />}>
          <h3 className='myClass' style={{ paddingTop: 0 }}>Viewed</h3>
        </Tab>
      </Tabs>
    </Container>
  )
};

export default CategoryPanel;

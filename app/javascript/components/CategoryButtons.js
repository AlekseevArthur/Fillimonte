import React, { useState } from 'react';
import { Button } from 'react-bootstrap';
import { BookmarkFill, EyeFill, Bookmark, Eye } from 'react-bootstrap-icons';
import Toaster from './Toaster';

const CategoryButtons = ({ filmId, viewed, watchlater }) => {
  const [state, setState] = useState({ watchlater, viewed })
  const [message, setMessage] = useState({ message: '', show: false })

  const handleClick = (e, category) => {
    e.preventDefault()
    fetch(`/user/${category}?film_id=${filmId}`, {
      method: 'POST'
    })
      .then(res => res.ok
        ? res.json()
        : setMessage({ message: 'Already added', show: true }))
      .then(data => {
        if (data) {
          setState({ watchlater: false, viewed: false, [category]: true })
          setMessage({ message: `Added to ${category}`, show: true })
        }
      })
      .catch(() => setMessage({ message: 'You are not login', show: true }))
  }

  return <>
    <Toaster
      message={message}
      setShow={() => setMessage({ message: '', show: false })} />
    <Button
      onClick={(e) => handleClick(e, 'viewed')}
      name='viewed'>
      {state.viewed ? <EyeFill /> : <Eye />}
    </Button>
    <Button
      name={'watchlater'}
      onClick={(e) => handleClick(e, 'watchlater')}
      variant="info">
      {state.watchlater ? <BookmarkFill /> : <Bookmark />}
    </Button>
  </>;
};

export default CategoryButtons;

import React, { useState } from 'react';
import { Button } from 'react-bootstrap';
import { BookmarkFill, EyeFill, Bookmark, Eye } from 'react-bootstrap-icons';
import Toaster from './Toaster';

const CategoryButtons = ({ filmId, viewed, watchlater }) => {
  const [state, setState] = useState({ watchlater: watchlater, viewed: viewed })
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
          setState({ ...state, [category]: !state[category] })
          setMessage({ message: `Added to ${category}`, show: true })
        }
      })
  }

  const load = () => {
    fetch(`/user/${category}?film_id=${filmId}`)
      .then()
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
      name='watchlater'
      onClick={(e) => handleClick(e, 'watchlater')}
      variant="info">
      {state.watchlater ? <BookmarkFill /> : <Bookmark />}
    </Button>
  </>;
};

export default CategoryButtons;

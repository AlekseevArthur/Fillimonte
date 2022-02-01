import React, { useState } from 'react'
import { Container, Spinner, Button } from 'react-bootstrap'
import Comment from './Comment'
import CommentForm from './CommentForm'

const CommentList = ({ login }) => {
  const [loading, setLoading] = useState(true)
  const [comments, setComments] = useState([])
  const [size, setSize] = useState(5)

  const getComments = () => {
    if (loading)
      fetch(`${window.location.href}/comments`)
        .then(res => res.json())
        .then(coms => {
          setLoading(false)
          setComments(coms.reverse())
        })
  }

  getComments()
  return (
    <Container style={{ textAlign: 'center' }}>
      {login
        ? <CommentForm
          updateComments={() => setLoading(true)} />
        : null}
      <hr />
      {loading
        ? <Spinner />
        : comments.slice(0, size).map((com, key) => <Comment
          comment={com}
          key={key}
          updateComments={() => setLoading(true)} />)}
      <hr />
      {comments.length > 5
        ? <Button
          onClick={
            () => setSize(size > 5 ? 5 : comments.length)}>
          {size > 5 ? 'Hide' : 'Show all'}
        </Button>
        : null
      }
    </Container>
  )
}

export default CommentList

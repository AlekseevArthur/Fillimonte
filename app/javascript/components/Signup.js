import React, { useState } from 'react'
import { Form, Button } from 'react-bootstrap'
import { useForm } from 'react-hook-form'

const Signup = ({ token }) => {
  const [error, setError] = useState(false)

  const { handleSubmit, register, formState: { errors } } = useForm();

  const onSubmit = values => {
    const data = new FormData()
    for (const key in values) {
      if (key === 'image') {
        data.append(`user[${key}]`, values[key][0])
      } else {
        data.append(`user[${key}]`, values[key])
      }
    }

    fetch('/users',
      {
        method: 'POST',
        headers: {
          'X-CSRF-Token': token,
        },
        body: data
      })
      .then(res => res.redirected ? window.location.href = '/' : setError(res))
  }

  return (
    <Form className='container' style={{ maxWidth: '400px' }} onSubmit={handleSubmit(onSubmit)}>
      <h1>SIGN UP</h1>
      {error ? <h4 style={{ color: 'red' }}>Error! Smth goes wrong</h4> : null}
      <Form.Group className='mb-3' controlId='formBasicEmail'>
        <Form.Label>Email address</Form.Label>
        <Form.Control
          name='user[email]'
          type='email'
          placeholder='Enter email'
          maxLength={20}
          {...register("email", {
            required: "Required",
            pattern: {
              value: /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i,
              message: "invalid email address"
            },
            maxLength: 20
          })} />
        {errors.email && errors.email.message}
      </Form.Group>

      <Form.Group className='mb-3' controlId='formBasicPassword'>
        <Form.Label>Password</Form.Label>
        <Form.Control
          name='user[password]'
          type='password'
          placeholder='Password'
          {...register("password", {
            required: "Required",
            minLength: {
              value: 6,
              message: '6 characters min'
            }
          })}
        />
        {errors.password && errors.password.message}
      </Form.Group>

      <Form.Group className='mb-3' controlId='formBasicPasswordConfirmation'>
        <Form.Label>Password confirmation</Form.Label>
        <Form.Control
          name='user[password_confirmation]'
          type='password'
          placeholder='Confirm'
          {...register("password_confirmation", {
            required: "Required",
            minLength: {
              value: 6,
              message: '6 characters min'
            }
          })} />
        {errors.password_confirmation && errors.password_confirmation.message}
      </Form.Group>

      <Form.Group className='mb-3' controlId='formBasicName'>
        <Form.Label>Name</Form.Label>
        <Form.Control
          name='user[name]'
          type='text'
          placeholder='Enter name'
          {...register("name", {
            required: "Required",
            pattern: {
              value: /^[A-Z0-9._%+-]/i,
              message: "invalid name"
            },
            maxLength: {
              value: 40,
              message: '40 characters max'
            },
            minLength: {
              value: 3,
              message: '3 characters min'
            }
          })} />
        {errors.name && errors.name.message}
      </Form.Group>

      <Form.Group className='mb-3' controlId='formBasicPhone'>
        <Form.Label>Phone</Form.Label>
        <Form.Control
          name='user[phone]'
          type='tel'
          placeholder='Enter phone (correct)'
          {...register("phone", {
            required: "Required",
            pattern: {
              value: /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im,
              message: "invalid phone number"
            },
            maxLength: {
              value: 20,
              message: '20 characters max'
            },
            minLength: {
              value: 8,
              message: '8 characters min'
            }
          })} />
        {errors.phone && errors.phone.message}
      </Form.Group>

      <Form.Group className='mb-3' controlId='formBasicImage'>
        <Form.Label>Profile image</Form.Label>
        <Form.Control
          name='user[image]'
          type='file'
          {...register("image", {
            required: "Required"
          })} />
        {errors.image && errors.image.message}
      </Form.Group>

      <Button variant='primary' type='submit'>
        Submit
      </Button>
      <div>
        <a href='/users/sign_in'>Sign in</a>
      </div>
    </Form>
  )
}

export default Signup

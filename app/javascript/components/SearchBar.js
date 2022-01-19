import React, { useRef } from 'react'
import { Form, Button, FormControl } from 'react-bootstrap'

const SearchBar = ({ handleChange }) => {
    const inputEl = useRef(null)
    const query = new URLSearchParams(window.location.search).get('query')
    const handleSubmit = e => {
        e.preventDefault()
        window.location.href = `?query=${inputEl.current.value}`
    }

    return (
        <Form onSubmit={handleSubmit} className='d-flex'>
            <FormControl
                onChange={() => handleChange(inputEl.current.value)}
                ref={inputEl}
                type='search'
                name='search'
                placeholder='Search'
                className='me-2'
                aria-label='Search'
                autoComplete='off'
                defaultValue={query}
            />
            <Button onClick={handleSubmit} variant='outline-success'>Search</Button>
        </Form>
    )
}

export default SearchBar

import React from 'react';
import { Modal, Button } from 'react-bootstrap';

const ModalDelete = (props) => {
  return (
    <Modal
      {...props}
      size="lg"
      aria-labelledby="contained-modal-title-vcenter"
      centered
    >
      <Modal.Header closeButton>
        <Modal.Title id="contained-modal-title-vcenter">
          Delete from category
        </Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <p>
          Are you sure you want to delete?
        </p>
      </Modal.Body>
      <Modal.Footer>
        <Button variant='primary' onClick={props.onHide}>Close</Button>
        <Button name='deleteModalBtn' variant='danger' onClick={props.onClose}>Delete</Button>
      </Modal.Footer>
    </Modal>
  );
}

export default ModalDelete;

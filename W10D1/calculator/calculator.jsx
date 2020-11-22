import React, { Component } from 'react';

export default class Calculator extends Component {
  constructor(props) {
    super(props);
    this.state = {
      result: 0,
      num1: '',
      num2: ''
    };
  }

  setNum1(e) {
    e.preventDefault();
    this.setState({
      num1: e.target.value ? parseInt(e.target.value) : ""
    });
  }

  setNum2(e) {
    e.preventDefault();
    this.setState({
      num2: e.target.value ? parseInt(e.target.value) : ""
    });
  }

  clear(e) {
    e.preventDefault();
    this.setState({
      num1: '',
      num2: '',
      result: 0
    });
  }

  calc(e) {
    e.preventDefault();
    const { num1, num2 } = this.state,
          op = e.target.innerHTML;
    this.setState({
      result: eval(`${num1} ${op} ${num2}`) || 0
    });
  }

  render() {
    const { num1, num2, result } = this.state;
    return (
      <>
        <h1>{result}</h1>
        <br />
        <input onChange={(e) => this.setNum1(e)} value={num1}/>
        <input onChange={(e) => this.setNum2(e)} value={num2}/>
        <button onClick={(e) => this.clear(e)}>Clear</button>

        <br />
        <button onClick={(e) => this.calc(e)}>+</button>
        <button onClick={(e) => this.calc(e)}>-</button>
        <button onClick={(e) => this.calc(e)}>*</button>
        <button onClick={(e) => this.calc(e)}>/</button>
      </>
    );
  }
}

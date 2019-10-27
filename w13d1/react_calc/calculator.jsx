import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    this.state = {num1: "", num2: "", result:0} ;
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.clear = this.clear.bind(this);
  }
  
  add(e) {
    e.preventDefault();
    let result = this.state.num1 + this.state.num2;
    this.setState({ result })
  }

  subtract(e) {
    e.preventDefault();
    let result= this.state.num1 - this.state.num2; 
    this.setState({ result });
  }

  multiply(e) {
    e.preventDefault();
    let result = this.state.num1 * this.state.num2;
    this.setState({ result })
  }

  divide(e) {
    e.preventDefault();
    let result = this.state.num1 / this.state.num2;
    this.setState({ result });
  }
  
  setNum1(e) {
    let num1;
    if (e.target.value) {
      num1 = parseInt(e.target.value);
    } else {
      num1 = "";
    }
    this.setState({ num1 });
  }

  setNum2(e) {
    let num2;
    if (e.target.value) {
      num2 = parseInt(e.target.value);
    } else {
      num2 = "";
    }
    this.setState({ num2 });
  }

  clear(e) {
    e.preventDefault();
    let num1 = "";
    let num2 = "";
    let result = 0;
    this.setState({num1, num2, result})
  }

  render(){
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input onChange={this.setNum1} value={this.state.num1} />
        <input onChange={this.setNum2} value={this.state.num2} />
        <button onClick={this.add}>+</button>
        <button onClick={this.subtract}>-</button>
        <button onClick={this.multiply}>*</button>
        <button onClick={this.divide}>/</button>
        <button onClick={this.clear}>CLEAR</button>
      </div>
    );
  }
}

export default Calculator;

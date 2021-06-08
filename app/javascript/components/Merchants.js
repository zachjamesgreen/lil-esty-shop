import React from "react"
import PropTypes from "prop-types"
import Merchant from './Merchant'
class Merchants extends React.Component {
  constructor(props) {
    super(props);
    this.state = {merchants: props.merchants}
  }


  render () {
    let merchantsList = this.state.merchants.map((merchant) => {
      return(<Merchant
          merchant={merchant}
          auth_token={this.props.auth_token}
      />)
    })
    return (
        merchantsList
    );
  }
}

Merchants.propTypes = {
  merchants: PropTypes.array,
  auth_token: PropTypes.string
}
export default Merchants

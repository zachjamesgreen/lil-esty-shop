import React from "react"
import PropTypes from "prop-types"
import axios from "axios";
class CreateMerchant extends React.Component {

  handleSubmit = (e) => {
    // e.preventDefault()
    // axios({
    //   method: 'post',
    //   headers: {'X-CSRF-Token': this.props.auth_token},
    //   url: "/admin/merchants/" + this.props.merchant.id + "/enabled",
    //   data: {
    //     enabled: !this.state.enabled
    //   }
    // })
    //     .then(res => this.setState({enabled: res.data.enabled}));
    //onSubmit={this.handleSubmit}
  }
  render () {
    return (
        <form action="/admin/merchants" method="post" >
          <input name="authenticity_token" type="hidden" value={this.props.auth_token}/>
          <input type="text" id="name" name="merchant[name]" placeholder="Name"/>
          <input type="submit" name="commit"/>
        </form>
    );
  }
}

CreateMerchant.propTypes = {
  auth_token: PropTypes.string
};
export default CreateMerchant

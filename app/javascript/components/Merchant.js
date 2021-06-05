import React from "react"
import PropTypes from "prop-types"
import axios from "axios"
class Merchant extends React.Component {
    constructor(props) {
        super(props);
        this.state = {enabled: props.merchant.enabled}
        // this.handleClick = this.handleClick.bind(this);
    }

    handleClick = () => {
        axios({
            method: 'post',
            headers: {'X-CSRF-Token': this.props.auth_token},
            url: "/admin/merchants/" + this.props.merchant.id + "/enabled",
            data: {
                enabled: !this.state.enabled
            }
        })
            .then(res => this.setState({enabled: res.data.enabled}));
    }

    render () {
        const merchant = this.props.merchant
        // this.setState({enabled: merchant.enabled})
        const url = this.props.url
        let enabled = this.state.enabled

        return (
            <li key={merchant.id} id={ "merchant-" + merchant.id}>
                <a className="merchant" href={url}>{merchant.name}</a>
                {this.state.enabled ? <button onClick={this.handleClick}>Enabled</button> : <button onClick={this.handleClick}>Disabled</button> }
            </li>
        );
    }
}

Merchant.propTypes = {
    merchant: PropTypes.object,
    url: PropTypes.string,
    auth_token: PropTypes.string
};
export default Merchant

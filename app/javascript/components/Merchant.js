import React from "react"
import PropTypes from "prop-types"
import axios from "axios"
class Merchant extends React.Component {
    constructor(props) {
        super(props);
        this.state = {enabled: props.merchant.enabled}
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
        const url = this.props.url

        return (
            <li key={merchant.id} id={ "merchant-" + merchant.id}>
                <a className="merchant" href={"/admin/merchants/" + merchant.id}>{merchant.name}</a>
                {this.state.enabled ? <button onClick={this.handleClick}>Disable</button> : <button onClick={this.handleClick}>Enable</button> }
            </li>
        );
    }
}

Merchant.propTypes = {
    merchant: PropTypes.object,
    auth_token: PropTypes.string
};
export default Merchant

import React from "react"
import PropTypes from "prop-types"
const { DateTime } = require("luxon");
class InCompleteInvoices extends React.Component {
  render () {
      const id = this.props.invoice_id
      const date = DateTime.fromHTTP(this.props.date);
    return (
        <li className="incomp" id={"invoice-" + id} key={id}>
            <a href={"/admin/invoices/" + id}>{id}</a> {date.toLocaleString(DateTime.DATE_HUGE)}
        </li>
    );
  }
}

InCompleteInvoices.propTypes = {
    invoice_id: PropTypes.number,
    date: PropTypes.string
};
export default InCompleteInvoices

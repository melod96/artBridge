package com.comvision.artBridge.sale.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PaymentEndingServlet
 */
@WebServlet("/paymentending.pg")
public class PaymentEndingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentEndingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				/*imp_uid = extract_POST_value_from_url('imp_uid') //post ajax request로부터 imp_uid확인

				payment_result = rest_api_to_find_payment(imp_uid) //imp_uid로 아임포트로부터 결제정보 조회
				amount_to_be_paid = query_amount_to_be_paid(payment_result.merchant_uid) //결제되었어야 하는 금액 조회. 가맹점에서는 merchant_uid기준으로 관리

				IF payment_result.status == 'paid' AND payment_result.amount == amount_to_be_paid
					success_post_process(payment_result) //결제까지 성공적으로 완료
				ELSE IF payment_result.status == 'ready' AND payment.pay_method == 'vbank'
					vbank_number_assigned(payment_result) //가상계좌 발급성공
				ELSE
					fail_post_process(payment_result) //결제실패 처리*/	
		String imp_uid = request.getParameter("imp_uid");
		String merchant_uid = request.getParameter("merchant_uid");
		//String status = request.getParameter("status");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

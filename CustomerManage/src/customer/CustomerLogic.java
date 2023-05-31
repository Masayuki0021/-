package customer;

import static constants.MessageConstants.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dao.CustomerDao;
import util.LogUtil;
/**
 * 顧客情報のロジック
 */
public class CustomerLogic {

    /**
     * DAO経由で顧客情報をDBから取得する
     * @param id 取得する顧客情報のID
     * @return 顧客情報Bean
     */
    public CustomerBean load(int id) {
        LogUtil.println(this.getClass().getSimpleName() + "#load");

        CustomerDao customerDao = new CustomerDao();
        CustomerBean customer = customerDao.load(id);

        return customer;
    }
    //樋口担当
    /**
     * DAO経由で顧客情報をDBに追加する
     * @param customer 顧客情報Bean
     * @return エラーメッセージ(処理成功時、null)
     */
    public String add(CustomerBean customer) {
        LogUtil.println(this.getClass().getSimpleName() + "#add");
        String errMessage = null;
        CustomerDao customerDao=new CustomerDao();
        errMessage=customerDao.add(customer);
        if(errMessage!=null){
            errMessage= MESSAGE_CAN_NOT_ADD;
        }
        return errMessage;
    }
    //樋口担当
    /**
     * DAO経由でDBの顧客情報を更新する
     * @param customer 顧客情報Bean
     * @return エラーメッセージ(処理成功時、null)
     */
    public String update(CustomerBean customer) {
        LogUtil.println(this.getClass().getSimpleName() + "#update");
        if (customer == null) {
            return MESSAGE_NO_EXIST_CORRESPOND_DATA;
        }
        String errMessage = null;
        CustomerDao customerDao=new CustomerDao();
        errMessage=customerDao.update(customer);
        if(errMessage!=null){
            errMessage = MESSAGE_CAN_NOT_UPDATE;
        }
        return errMessage;
    }
    //樋口担当
    /**
     * DAO経由でDBの顧客情報を削除する
     * @param customer 顧客情報Bean
     * @return エラーメッセージ(処理成功時、null)
     */
    //樋口担当
    public String delete(CustomerBean customer) {
        LogUtil.println(this.getClass().getSimpleName() + "#delete");

        if (customer == null) {
            return MESSAGE_NO_EXIST_CORRESPOND_DATA;
        }

        String errMessage = null;
        CustomerDao customerDao = new CustomerDao();
        errMessage = customerDao.delete(customer.getId());

        if (errMessage != null) {
            errMessage = MESSAGE_CAN_NOT_DELETE;
        }
        return errMessage;
    }
    //樋口担当
    /**
     * リクエスト内の顧客情報をセッションに顧客情報Beanとして設定する
     * @param request 顧客情報を含むリクエスト
     */
    public void setCustomerBeanFromRequestToSession(HttpServletRequest request) {
        LogUtil.println(this.getClass().getSimpleName() + "#setCustomerBeanFromRequestToSession");

        HttpSession session=request.getSession();
        String NAME=request.getParameter("NAME");
        String ZIP=request.getParameter("ZIP");
        String ADDRESS1=request.getParameter("ADDRESS1");
        String ADDRESS2=request.getParameter("ADDRESS2");
        String TEL=request.getParameter("TEL");
        String FAX=request.getParameter("FAX");
        String EMAIL=request.getParameter("EMAIL");

        CustomerBean customer=(CustomerBean)session.getAttribute("customer");
        if(customer==null) {
            customer=new CustomerBean();
        }
        customer.setName(NAME);
        customer.setZip(ZIP);
        customer.setAddress1(ADDRESS1);
        customer.setAddress2(ADDRESS2);
        customer.setTel(TEL);
        customer.setFax(FAX);
        customer.setEmail(EMAIL);
        session.setAttribute("customer", customer);


    }
}
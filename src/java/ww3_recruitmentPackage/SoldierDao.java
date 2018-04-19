/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ww3_recruitmentPackage;

import java.util.ArrayList;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import org.hibernate.Session;

/**
 *
 * @author maple
 */
public class SoldierDao {
    
    public static void saveUser(Soldier soldier) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();

        session.save(soldier);

        session.getTransaction().commit();
    }

    public void updateUser(Soldier soldier) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();

        session.merge(soldier);

        session.getTransaction().commit();
    }

    public void deleteUser(Soldier soldier) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();

        session.delete(soldier);

        session.getTransaction().commit();
    }

    public void getUser() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();

        ArrayList<Soldier> list = (ArrayList<Soldier>) session.createQuery("from soldiers").list();
        if (list != null) {
            for (int i = 0; i < list.size(); i++) {
                System.out.println("User ID : " + list.get(i).getId());
                System.out.println("User Name : "+ list.get(i).getName());
                System.out.println("User Age : "+ list.get(i).getAge());
                System.out.println("User Email : " + list.get(i).getEmail());
            }
        }
        session.getTransaction().commit();
    }
}

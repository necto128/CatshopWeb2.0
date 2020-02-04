package dao;

import consts.Const;
import model.Cat;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class CatDAO {
    //////////////////ДОБАВЛЕНИЕ ЗАПИСИ
    public static void addRecords(Cat cat) {

        String insert = "INSERT INTO " + Const.USER_TABLE + "(" + Const.NAME_CAT + "," + Const.ID_DAD + "," + Const.ID_MAM + "," + Const.GENDER + ") VALUES(?,?,?,?)";

        try (PreparedStatement prSt = ConnectionDb.getDbConnection().prepareStatement(insert)) {
            prSt.setString(1, cat.getNameCat());
            prSt.setInt(2, cat.getIdDad());
            prSt.setInt(3, cat.getIdMam());
            prSt.setString(4, cat.getGender());
            prSt.executeUpdate();

        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Ошибка 2");
            ex.printStackTrace();
        }
    }

    ///////////////////////////////ВЫВОД ЗАПИСЕЙ

    public static List<Cat> dataOutput() throws SQLException, ClassNotFoundException {
        ResultSet rs;
        List<Cat> listcat = new ArrayList<>();
        try (Statement st = ConnectionDb.getDbConnection().createStatement();) {

            String Select = "SELECT *FROM " + Const.USER_TABLE;

            rs = st.executeQuery(Select);

            while (rs.next()) {
                int idCat = rs.getInt("id");
                String nameCat = rs.getString("name_cat");
                int idDad = rs.getInt("id_dad");
                int idMam = rs.getInt("id_mam");
                String gender = rs.getString("gender");
                Cat cat = new Cat(idCat, nameCat, idDad, idMam, gender);
                listcat.add(cat);
            }
        }
        return listcat;
    }
/////////////////////////////////ПОИСК ЗАПИСИ

    public static List<Cat> searchCatsById(Cat cat1) {
        ResultSet rs;
        List<Cat> listcat = new ArrayList<>();
        try (Statement st = ConnectionDb.getDbConnection().createStatement();) {
            String Select = "SELECT *FROM " + Const.USER_TABLE + " WHERE id=" + cat1.getIdCat();

            rs = st.executeQuery(Select);
            while (rs.next()) {
                int idCat = rs.getInt("id");
                String nameCat = rs.getString("name_cat");
                int iddad = rs.getInt("id_dad");
                int idmam = rs.getInt("id_mam");
                String gender = rs.getString("gender");
                Cat cat = new Cat(idCat, nameCat, iddad, idmam, gender);
                listcat.add(cat);
            }

        } catch (Exception e) {
        }
        return listcat;
    }
////////////////////////////////////////ОБНОВЛЕНИЕ ЗАПИСИ

    public static void updataCats(Cat cat) {

        try (Statement st = ConnectionDb.getDbConnection().createStatement();) {


            String updata = "UPDATE " + Const.USER_TABLE + " set name_cat='" + cat.getNameCat() + "',id_dad='" + cat.getIdDad() + "',id_mam='" + cat.getIdMam() + "' WHERE id=" + cat.getIdCat();
            st.executeUpdate(updata);

            System.out.println("///////////////////////////////////\n");
        } catch (Exception e) {
            System.out.println("ошибка 6(внутрянняя)");
        }
    }
    //SELECT EXISTS(SELECT id FROM table WHERE id = 1
    /////////////////////////////////УДАЛЕНИЕ ЗАПИСИ

    public static void deleteRecord(Cat cat) {

        try (Statement prSt = ConnectionDb.getDbConnection().createStatement();) {
            String delete = "DELETE FROM " + Const.USER_TABLE + " WHERE id=" + cat.getIdCat();
            prSt.executeUpdate(delete);
        } catch (Exception e) {
        }

    }

}

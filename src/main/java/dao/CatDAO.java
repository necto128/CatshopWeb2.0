package dao;

import consts.Const;
import model.Cat;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
        String Select = "SELECT *FROM " + Const.USER_TABLE;
        try (PreparedStatement st = ConnectionDb.getDbConnection().prepareStatement(Select)) {

            rs = st.executeQuery();

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

    public static Cat searchCatsById(int cat1) {
        ResultSet rs;
        Cat cat = null;
        String Select = "SELECT *FROM " + Const.USER_TABLE + " WHERE id=" + cat1;

        try (PreparedStatement st = ConnectionDb.getDbConnection().prepareStatement(Select)) {

            rs = st.executeQuery();
            while (rs.next()) {
                int idCat = rs.getInt("id");
                String nameCat = rs.getString("name_cat");
                int iddad = rs.getInt("id_dad");
                int idmam = rs.getInt("id_mam");
                String gender = rs.getString("gender");
                cat = new Cat(idCat, nameCat, iddad, idmam, gender);

            }

        } catch (Exception e) {
        }
        return cat;
    }
////////////////////////////////////////ОБНОВЛЕНИЕ ЗАПИСИ

    public static void updataCats(Cat cat) {

        String updata = "UPDATE " + Const.USER_TABLE + " set name_cat='" + cat.getNameCat() + "',id_dad='" + cat.getIdDad() + "',id_mam='" + cat.getIdMam() + "' WHERE id=" + cat.getIdCat();
        try (PreparedStatement st = ConnectionDb.getDbConnection().prepareStatement(updata)) {

            st.executeUpdate();

            System.out.println("///////////////////////////////////\n");
        } catch (Exception e) {
            System.out.println("ошибка 6(внутрянняя)");
        }
    }
    //SELECT EXISTS(SELECT id FROM table WHERE id = 1
    /////////////////////////////////УДАЛЕНИЕ ЗАПИСИ

    public static void deleteRecord(int cat) {
        String delete = "DELETE FROM " + Const.USER_TABLE + " WHERE id=" + cat;
        try (PreparedStatement prSt = ConnectionDb.getDbConnection().prepareStatement(delete)) {
            prSt.executeUpdate();
        } catch (Exception e) {
        }

    }

}

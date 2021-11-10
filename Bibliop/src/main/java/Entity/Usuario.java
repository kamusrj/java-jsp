
package Entity;

public class Usuario {
    
    private int id_usr;
    private String nickname;
    private String clave;
    private Persona personadato;
    private Rol roldato;

    public int getId_usr() {
        return id_usr;
    }

    public void setId_usr(int id_usr) {
        this.id_usr = id_usr;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public Persona getPersonadato() {
        return personadato;
    }

    public void setPersonadato(Persona personadato) {
        this.personadato = personadato;
    }

    public Rol getRoldato() {
        return roldato;
    }

    public void setRoldato(Rol roldato) {
        this.roldato = roldato;
    }

}

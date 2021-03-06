package com.lgh.sys.entity;


import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Table;
import com.lgh.common.entity.BaseEntity;

@Entity
@Table(name = "t_department")
public class Department extends BaseEntity implements Serializable {

	// Fields

	private static final long serialVersionUID = 8577494607947632638L;
	
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	/*private Set<Admin> admins = new HashSet<Admin>(0);*/

	/*@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "department")
	public Set<Admin> getAdmins() {
		return this.admins;
	}

	public void setAdmins(Set<Admin> admins) {
		this.admins = admins;
	}*/

}
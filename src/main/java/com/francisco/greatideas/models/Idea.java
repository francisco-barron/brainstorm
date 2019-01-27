package com.francisco.greatideas.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

import javax.validation.constraints.Size;


import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="ideas")
public class Idea {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@Size(min=1, max=255, message=" Please enter a name for your BrainStorm.")
	private String name;
	private String creator;

	@Column(updatable=false)
	@DateTimeFormat(pattern = "MM/dd/yyyy HH:mm:ss")
    private Date createdAt;
	@DateTimeFormat(pattern = "MM/dd/yyyy HH:mm:ss")
    private Date updatedAt;
    
	@ManyToMany
	@JoinTable(
			name = "likes",
	        joinColumns = @JoinColumn(name="idea_id"),
	        inverseJoinColumns = @JoinColumn(name="user_id")
	)
	private List<User> users;
	
    @PrePersist
    protected void onCreate(){this.createdAt = new Date();}
	@PreUpdate
    protected void onUpdate(){this.updatedAt = new Date();}
    
	public Idea() {
		this.createdAt = new Date();
	    this.updatedAt = new Date();
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	
	
}

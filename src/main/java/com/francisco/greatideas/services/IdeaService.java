package com.francisco.greatideas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.francisco.greatideas.models.Idea;
import com.francisco.greatideas.repositories.IdeaRepository;

@Service
public class IdeaService {
	private final IdeaRepository ideaRepo;
	
	public IdeaService(IdeaRepository ideaRepo) {
		this.ideaRepo = ideaRepo;
	}
	
	//find all
	public List<Idea> findAllIdeas(){
		return ideaRepo.findAll();
	}
	
	//find by id
	
	public Idea findIdeaById(Long id) {
		Optional<Idea> myIdea = ideaRepo.findById(id);
		if(myIdea.isPresent()) {
			return myIdea.get();
		}else {
			return null;
		}
	}
	
	//create course
	public Idea createIdea(Idea myIdea) {
		return ideaRepo.save(myIdea);
	}
	//update course
	public void updateIdea(Idea myIdea) {
		ideaRepo.save(myIdea);
	}
	//delete course
	public void deleteIdea(Idea idea) {
		ideaRepo.delete(idea);
	}

}

